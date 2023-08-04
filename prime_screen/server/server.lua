local countdown, language = false, cl_config.language[cl_config.screenshot.language]

RegisterCommand(sv_config.screenshot.general.command_name, function(src, args, rawCommand)
    if src ~= 0 then
        if not countdown then
            CheckCooldown()
            TriggerClientEvent("prime_screen:screenshot", src, sv_config.screenshot.webhook.webhooks.storage)
        else
            Notification(src, "Screenshot", language["cooldown"], "error", 2500)
        end
    else
        print(language["console_command"])
    end
end)

RegisterNetEvent("prime_screen:sendEmbed")
AddEventHandler("prime_screen:sendEmbed", function(url)
    PerformHttpRequest(sv_config.screenshot.webhook.webhooks.offical, function(err, text, headers)
    end, "POST", json.encode({
      username = "Prime-Screen",
      embeds = {
        {
            author = {
                name = sv_config.screenshot.webhook.embed.author.name,
                url = sv_config.screenshot.webhook.embed.author.url,
                icon_url = sv_config.screenshot.webhook.embed.author.icon_url
            },
            color = sv_config.screenshot.webhook.embed.color,
            image = {
                url = url
            },
            title = sv_config.screenshot.webhook.embed.title,
            description = string.format(sv_config.screenshot.webhook.embed.description, GetPlayerName(source), sv_config.screenshot.general.command_name),
            footer = {
                text = os.date("%Y/%m/%d %X").. " - Made By Prime-Scripts",
                icon_url = sv_config.screenshot.webhook.embed.footer.icon_url
            }
        }
      }
    }), {
      ["Content-Type"] = "application/json"
    })
    Notification(source, "Screenshot", language["create_screenshot"], "success", 5000)
end)

function CheckCooldown()
    if sv_config.screenshot.general.cooldown.enable then
        countdown = true
        Citizen.SetTimeout(sv_config.screenshot.general.cooldown.time * 1000, function()
            countdown = false
        end)
    end
end