#!/bin/sh

# Тут мы создали функцию "run", которая проверяет с помощью pgrep не запущена ли уже указанная тут программа. 
# Если запущена - скип, если не запущена - запустить. А потом запускаем данную функцию с нужными нам приложениями.
run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# Путь до polkit agent. Я выбрал lxsession
# Нужен чтоб проги с правами админа запускать. Всплывающее окно будет с просьбой ввести пароль, например при запуске timeshift 
run /usr/bin/lxpolkit

# Делать скрины экрана
run ksnip

# История буфера обмена
run copyq
