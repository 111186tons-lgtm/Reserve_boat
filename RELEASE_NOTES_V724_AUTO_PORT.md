# Boat Reserve V7.2.4 — automatic port cleanup

- Stops stale Boat Reserve launcher, Uvicorn and Telegram bot processes left by older extracted project copies.
- Does not terminate unrelated Python processes.
- Tries local ports 8787 through 8800 instead of failing when 8787 is occupied.
- Adds `CLEAN_OLD_BOAT_RESERVE_PROCESSES.cmd` for manual one-click cleanup.
- Keeps the no-registration Pinggy-first public access flow from V7.2.3.
