local INPUT_AIM      = 25
local UseFPS         = false
local WEAPON_UNARMED = GetHashKey('WEAPON_UNARMED')

-- Controls
Citizen.CreateThread( function()

  while true do 
    
    Citizen.Wait(0)

    local playerId  = PlayerId()
    local playerPed = PlayerPedId()

    if GetSelectedPedWeapon(playerPed) ~= WEAPON_UNARMED then

      if IsControlJustPressed(0, INPUT_AIM) then
        
        if UseFPS then

          SetTimeout(200, function()
            if not IsPlayerFreeAiming(playerId) then
              UseFPS = false
            end
          end)

        else

          SetTimeout(200, function()
            if not IsPlayerFreeAiming(playerId) then
              UseFPS = true
            end
          end)

        end

      end

      if UseFPS then
        SetFollowPedCamViewMode(4)
      else
        SetFollowPedCamViewMode(0)
      end

    end

  end

end)
