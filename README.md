# Mes dramas — site Cloudflare

Pages (site) + Pages Functions (API) + D1 (base de données). Aucun build.

## Mise en ligne (une seule fois)
```
npm i -g wrangler && wrangler login
wrangler d1 create dramas-db            # copie le database_id dans wrangler.toml
wrangler d1 execute dramas-db --remote --file=schema.sql
wrangler d1 execute dramas-db --remote --file=seed.sql      # importe ton Excel
wrangler pages deploy public --project-name=dramas
wrangler pages secret put TMDB_KEY --project-name=dramas   # clé API v3 gratuite sur themoviedb.org (pour les nouveautés)
```
Après le premier déploiement, relance `wrangler pages deploy public --project-name=dramas` pour que la liaison D1 soit prise en compte.

## À faire absolument : protéger le site
L'API écrit dans ta base : sans protection, quiconque connaît l'adresse peut modifier ta liste.
Cloudflare > Zero Trust > Access > Applications > Ajouter > Self-hosted > ton domaine `dramas.pages.dev`,
règle « Allow » sur ton e-mail. Gratuit jusqu'à 50 personnes.

## Fonctionnement
- Recommandation : moyenne de tes notes par genre, ramenée vers ta moyenne globale quand un genre a peu de notes (2 notes fictives). Un drama = moyenne de ses genres. Les dramas sans genre n'ont pas de score.
- Nouveautés : TMDB, séries coréennes et chinoises sorties depuis 75 jours ou à venir sous 60 jours, mises en cache 6 h.
