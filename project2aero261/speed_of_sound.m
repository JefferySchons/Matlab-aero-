function [a] = speed_of_sound(Y,RG,T)
    %calculates speed of sound
    a=(Y*RG*T).^(1/2);
end