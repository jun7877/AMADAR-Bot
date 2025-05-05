#!/data/data/com.termux/files/usr/bin/bash

# ألوان
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

clear
echo -e "${CYAN}"
figlet -f slant "GataBot-MD" | lolcat
echo -e "${GREEN}مرحباً بك في مثبت GataBot-MD${RESET}"
sleep 1
echo -e "${YELLOW}جارٍ البدء في التحضير...${RESET}"
sleep 1

# تثبيت المتطلبات
echo -e "${CYAN}تثبيت الأدوات الأساسية...${RESET}"
pkg update -y && pkg upgrade -y
pkg install -y nodejs ffmpeg imagemagick yarn figlet toilet lolcat
clear

# شاشة انتظار لطيفة
echo -e "${YELLOW}جارٍ تثبيت الحزم المطلوبة...${RESET}"
sleep 1
yarn install
echo -e "${GREEN}تم التثبيت بنجاح!${RESET}"
sleep 1

# تفعيل الإعدادات
echo -e "${CYAN}هل ترغب بتفعيل جميع الإعدادات تلقائيًا؟ (y/n)${RESET}"
read enable_settings
if [[ $enable_settings == "y" || $enable_settings == "Y" ]]; then
    echo -e "${YELLOW}جاري تفعيل الإعدادات...${RESET}"
    cp config.example.js config.js
    sed -i 's/enabled: false/enabled: true/g' config.js
    sleep 1
    echo -e "${GREEN}تم تفعيل جميع الإعدادات.${RESET}"
else
    echo -e "${RED}تم تجاوز تفعيل الإعدادات.${RESET}"
fi

# تشغيل البوت
echo -e "${CYAN}هل تريد تشغيل البوت الآن؟ (y/n)${RESET}"
read run_bot
if [[ $run_bot == "y" || $run_bot == "Y" ]]; then
    echo -e "${GREEN}يتم الآن تشغيل GataBot-MD...${RESET}"
    sleep 1
    npm start
else
    echo -e "${YELLOW}تم الانتهاء من التثبيت! يمكنك تشغيل البوت لاحقًا باستخدام:${RESET} ${CYAN}npm start${RESET}"
fi
