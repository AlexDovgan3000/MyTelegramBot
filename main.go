package main

import (
    "os"
    "time" // Імпортуємо пакет time
    "gopkg.in/telebot.v3"
)

func main() {
    token := os.Getenv("TELE_TOKEN")
    if token == "" {
        panic("TELE_TOKEN environment variable not set")
    }

    pref := telebot.Settings{
        Token:  token,
        Poller: &telebot.LongPoller{Timeout: 10 * time.Second}, // Використання пакету time тут
    }

    bot, err := telebot.NewBot(pref)
    if err != nil {
        panic(err)
    }

    bot.Handle(telebot.OnText, func(c telebot.Context) error {
        return c.Send("Hello, World!")
    })

    bot.Start()
}

