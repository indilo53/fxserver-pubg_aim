local INPUT_ATTACK  = 24
local INPUT_ATTACK2 = 257
local INPUT_AIM     = 25

local UseFPS = false

-- Controls
Citizen.CreateThread( function()

  while true do 
    
    Citizen.Wait(0)

    local playerId = PlayerId()

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

end)