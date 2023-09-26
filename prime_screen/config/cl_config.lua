config = {}

config.general = {
    language = "en" -- "de" or "en"
}

config.screenshot = {
    general = {
        command_name = "foto", -- command name to create screenshot
        cooldown = {
            enable = true, -- false to disable
            time = 10, -- in seconds
        }
    },
    webhook = {
        webhooks = {
            offical = "https://discord.com/api/webhooks/1145007873575882792/DWtP0XwAS4opo0wwamfDy89k92auCRGR7_heY1CM0SBu7J7cLNSHkRmwe3v10yWkPDNJ", -- offical webhook
            storage = "https://discord.com/api/webhooks/1145007873575882792/DWtP0XwAS4opo0wwamfDy89k92auCRGR7_heY1CM0SBu7J7cLNSHkRmwe3v10yWkPDNJ" -- webhook to safe the img / must be set
        },
        embed = {
            color = 3447003, -- https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812
            author = {
                name = "Prime-Scripts",
                url = "https://discord.gg/prime-scripts",
                icon_url = "https://media.discordapp.net/attachments/1135664436208734330/1135664967283126333/Prime-Animiert.gif"
            },
            title = "Ein neues Foto wurde geteilt!",
            description = "**%s** hat mit `/%s` ein Foto geteilt!",
            footer = {
                icon_url = "https://media.discordapp.net/attachments/1135664436208734330/1135664967283126333/Prime-Animiert.gif"
            }
        }
    }
}

config.language = {
    ["de"] = {
        ["create_screenshot"] = "Du hast erfolgreich ein Foto geteilt!",
        ["cooldown"] = "Du hast aktuell noch einen Cooldown",
        ["console_command"] = "Du kannst aus der Console kein Screenshot erstellen."
    },
    ["en"] = {
        ["create_screenshot"] = "You have successfully shared a photo!",
        ["cooldown"] = "You currently have a cooldown",
        ["console_command"] = "You cannot take a screenshot from the console."
    }
}


config.notify = function(src, title, msg, type, time)
    TriggerClientEvent("prime_notify", src, type, title, msg, time)
end
