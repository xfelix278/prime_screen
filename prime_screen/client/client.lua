RegisterNetEvent("prime_screen:screenshot")
AddEventHandler("prime_screen:screenshot", function(cl_webhook_url)
    exports["screenshot-basic"]:requestScreenshotUpload(cl_webhook_url, 'files[]', function(data)
        local img = json.decode(data)
        if not img then print("Du hast vergessen die Storage-Webhook einzufügen") return end
        TriggerServerEvent("prime_screen:sendEmbed", img.attachments[1].url)
    end)
end)
