local countdown, language = {}, config.language[config.general.language]

RegisterCommand(config.screenshot.general.command_name, function(src, args, rawCommand)
    TriggerClientEvent("prime_notify", "success", "Test", "test", 1000)
    if src ~= 0 then
        if not countdown[src] then
            CheckCooldown(src)
            TriggerClientEvent("prime_screen:screenshot", src, config.screenshot.webhook.webhooks.storage)
        else
            config.notify(src, "Screenshot", language["cooldown"], "error", 2500)
        end
    else
        print(language["console_command"])
    end
end)

RegisterNetEvent("prime_screen:sendEmbed")
AddEventHandler("prime_screen:sendEmbed", function(url)
    PerformHttpRequest(config.screenshot.webhook.webhooks.offical, function(err, text, headers)
    end, "POST", json.encode({
    username = "Prime-Screen",
    embeds = {
        {
            author = {
                name = config.screenshot.webhook.embed.author.name,
                url = config.screenshot.webhook.embed.author.url,
                icon_url = config.screenshot.webhook.embed.author.icon_url
            },
            color = config.screenshot.webhook.embed.color,
            image = {
                url = url
            },
            title = config.screenshot.webhook.embed.title,
            description = string.format(config.screenshot.webhook.embed.description, GetPlayerName(source), config.screenshot.general.command_name),
            footer = {
                text = os.date("%Y/%m/%d %X").. " - Made By Prime-Scripts",
                icon_url = config.screenshot.webhook.embed.footer.icon_url
            }
        }
    }
    }), {
    ["Content-Type"] = "application/json"
    })
    config.notify(source, "Screenshot", language["create_screenshot"], "success", 5000)
end)

function CheckCooldown(src)
    if config.screenshot.general.cooldown.enable then
        countdown[src] = true
        Citizen.SetTimeout(config.screenshot.general.cooldown.time * 1000, function()
            countdown[src] = false
        end)
    end
end
