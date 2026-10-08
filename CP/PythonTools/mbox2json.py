
# python $misc/CP/PythonTools/mbox2json.py -i takeout.mbox -o takeout.json
#  ***************************************************************
#  adapted from  https://github.com/huolter/mbox2json  with thanks
#  ***************************************************************
#   (on my systems, $GRs/d-CP/d-encoding/d-Python/huolter-mbox2json/mbox_to_json_converter.py)
#   for a Google mbox Takeout
#    to have less noisy output
#    brought up-to-date with  GitHub Copilot CLI

import argparse
import email
import json
import mailbox
from datetime import datetime
from email.utils import parsedate_to_datetime


def parse_date(date_string: str) -> str | None:
    try:
        return parsedate_to_datetime(date_string).isoformat()
    except ValueError:
        try:
            return datetime.strptime(date_string, "%d-%b-%Y %H:%M").isoformat()
        except ValueError:
            print(f"Warning: Unable to parse date '{date_string}'. Using None instead.")
            return None


def extract_email_data(message: email.message.Message) -> dict[str, str | None]:
    return {
        "date": parse_date(str(message["date"])) if message["date"] else None,
        "from": str(message["from"]),
        "to": str(message["to"]),
        "subject": str(message["subject"]),
        "body": get_email_body(message)
    }


def get_email_body(message: email.message.Message) -> str:
    if message.is_multipart():
        for part in message.walk():
            if part.get_content_type() == "text/plain":
                return part.get_payload(decode=True).decode(errors='replace')
    return message.get_payload(decode=True).decode(errors='replace')


def mbox_to_json(mbox_file: str, json_file: str) -> None:
    mbox = mailbox.mbox(mbox_file)
    emails: list[dict[str, str | None]] = []

    for i, message in enumerate(mbox, 1):
        try:
            emails.append(extract_email_data(message))
        except Exception as e:
            print(f"Error processing email {i} in {mbox_file}: {str(e)}")

    with open(json_file, 'w', encoding='utf-8') as f:
        json.dump(emails, f, ensure_ascii=False, indent=2)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert mbox file to JSON")
    parser.add_argument("-i", "--input", default="mail.mbox", help="Input mbox file (default: mail.mbox)")
    parser.add_argument("-o", "--output", default="mail_output.json", help="Output JSON file (default: mail_output.json)")
    args = parser.parse_args()

    mbox_to_json(args.input, args.output)
