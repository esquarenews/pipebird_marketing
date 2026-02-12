# pipebird.io marketing site

Marketing site for `pipebird.io` built with Ruby `4.0` and Rails `8.1`.

## Stack
- Ruby `4.0.x`
- Rails `8.1.x`
- Propshaft + Dart Sass
- Hotwire (Turbo + Stimulus via importmap)
- Minitest + SimpleCov (minimum 80% coverage)

## Current pages
- `/` (Home)
- `/pricing`
- `/crm-integration`
- `/heroku-connect-migration`
- `/contact-us`

## Run locally
```bash
bin/setup
bin/dev
```

Open [http://localhost:3000](http://localhost:3000).

## Run on port 3001
```bash
bin/rails server -p 3001
```

Open [http://localhost:3001](http://localhost:3001).

## Run tests
```bash
bin/rails test
```

Coverage report is generated in `coverage/`.

## Notes
- Pricing monthly/annual switching is implemented with a Stimulus controller.
