#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[1;34m"
RESET="\033[0m"

function help_menu() {
  echo -e "${BLUE}🛠  Dev CLI – Available commands:${RESET}"
  echo -e "  ${GREEN}start${RESET}         – Start all services"
  echo -e "  ${GREEN}stop${RESET}          – Stop all services"
  echo -e "  ${GREEN}status${RESET}        – Show running status"
  echo -e "  ${GREEN}test${RESET}          – Run integration test"
  echo -e "  ${GREEN}frontend${RESET}      – Start frontend only"
  echo -e "  ${GREEN}backend${RESET}       – Start backend only"
  echo -e "  ${GREEN}stop-frontend${RESET} – Stop frontend only"
  echo -e "  ${GREEN}stop-backend${RESET}  – Stop backend only"
  echo -e "  ${GREEN}help${RESET}          – Show this help"
}

function not_found() {
  echo -e "${RED}❌ Command not found: $1${RESET}"
  help_menu
}

case "$1" in
  start) "$DIR/startAll.sh" ;;
  stop) "$DIR/stopAll.sh" ;;
  test) "$DIR/test.sh" ;;
  status) "$DIR/status.sh" ;;
  frontend) "$DIR/startFrontend.sh" ;;
  backend) "$DIR/startBackend.sh" ;;
  stop-frontend) "$DIR/stopFrontend.sh" ;;
  stop-backend) "$DIR/stopBackend.sh" ;;
  help | --help | -h) help_menu ;;
  *) not_found "$1" ;;
esac
