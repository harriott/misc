vim: nospell:

    $ITref/CP/web/languages/JavaScript/javascript.js
    $ITref/CP/web/languages/JavaScript/

JavaScript

# JSON
    $ITref/CP/web/languages/JavaScript/JSON/learnjson.json
    wiki/JSON

no comments allowed

## jq
    $ITref/CP/web/languages/JavaScript/JSON/learnjq.sh
    curl http://api.open-notify.org/iss-now.json | jq '.' # current position of ISS
    jq -h
    jq 'length' <JSON>
    jq 'sort_by(.date)' <JSON>

- `fruits.json`
- `jq -c '.' $ITmore/WAN/WebDesign/Caddy/caddy.json` (`--compact-output`) minified
- `jq -r '[.logins[].hostname] | @csv' $DrThb/logins.json` (= `'.logins|.[]|.hostname'`)
- `jq -S '.' $DrThb/session.json` (`--sort-keys`) unminified

# Node.js
    node -h  # --help
    node -v  # --version

## npm
    npm install
    npm ls -g
    npm un[install] -g [<package>]
    npm up[date] -g [<package>]
    npm prefix -g  # =  npm config get prefix
    npm -v  # --version
    npx cowsay Moooooooo!

package manager

### Prettier
- fixes `CSS`, `HTML`, `JSON`, `YAML` among others
- `prettier` (= `prettier -h` (`--help`)) `$ABno/Bash/bashrc-generic`

##### recursively
- `prettier . -c` (= `--check`)
- `prettier . -l` (= `--list-different`)
- `prettier . -w` (= `--write`)

### serve
    htmlhint $ITcore/serve/Caddy/index.html

#### Astro
    npm run dev -- -h  # --help
    npx astro --help
    npx astro --version
    npx astro docs  # launches Astro Docs
    npx astro info  # environment

##### development server
    http://localhost:4321
    npm run dev
    npx astro dev

- gets dev toolbar at bottom
- HMR ensures instant updates

### cspell
    cspell check <code_file>
    cspell lint --help

