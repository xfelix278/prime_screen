sv_config = {}

sv_config.screenshot = {
    general = {
        command_name = "foto", -- command name to create screenshot
        cooldown = {
            enable = true, -- false to disable
            time = 10, -- in seconds
        }
    },
    webhook = {
        webhooks = {
            offical = "YOUR-WEBOOK", -- offical webhook
            storage = "YOUR-WEBHOOK" -- webhook to safe the img / must be set
        },
        embed = {
            color = 3447003, -- https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812
            author = {
                name = "Prime-Scripts",
                url = "https://discord.gg/prime-scripts",
                icon_url = "https://cdn.discordapp.com/attachments/1124435868707455058/1124435869034627132/Prime-Animiert.gif"
            },
            title = "Ein neues Foto wurde geteilt!",
            description = "**%s** hat mit `/%s` ein Foto geteilt!",
            footer = {
                icon_url = "https://cdn.discordapp.com/attachments/1124435868707455058/1124435869034627132/Prime-Animiert.gif"
            }
        }
    }
}

function Notification(src, title, msg, type, time)
    -- your Notify Trigger!
    -- e.g: TriggerClientEvent("prime_hud:notify", src, type, title, msg, time)
end