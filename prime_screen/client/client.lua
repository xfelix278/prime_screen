RegisterNetEvent("prime_screen:screenshot")
AddEventHandler("prime_screen:screenshot", function(cl_webhook_url)
    if not GetInvokingResource() then
        exports["screenshot-basic"]:requestScreenshotUpload(cl_webhook_url, 'files[]', function(data)
            local img = json.decode(data)
            if img.attachments[1].filename == "screenshot.jpg" then
                TriggerServerEvent("prime_screen:sendEmbed", img.attachments[1].url)
            end
        end)
    end
end)
