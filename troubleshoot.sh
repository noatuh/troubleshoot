#!/bin/bash
while true; do
  echo "Network Troubleshooting Tool"
  echo "1. Ping"
  echo "2. Tracepath"
  echo "3. Nslookup"
  echo "4. Netstat"
  echo "5. ARP"
  echo "6. Clear Screen"
  echo "7. Exit"
  read -p "Choose an option: " option

  case $option in
    1) read -p "Enter IP or Hostname: " host
       while true; do
         read -p "How many packets to send: " count
         if [[ $count =~ ^[0-9]+$ ]]; then
           ping -c $count $host
           break
         else
           echo "Please enter an integer value."
         fi
       done
       ;;
    2) read -p "Enter IP or Hostname: " host
       timeout 10 tracepath $host
       ;;
    3) read -p "Enter IP or Hostname: " host
       nslookup $host
       ;;
    4) netstat -r
       ;;
    5) arp -a
       ;;
    6) clear
       ;;
    7) exit
       ;;
    *) echo "Invalid option. Please try again."
       ;;
  esac
done
