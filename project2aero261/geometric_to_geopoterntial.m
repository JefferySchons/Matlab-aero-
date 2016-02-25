function [h]= geometric_to_geopoterntial(hg,Re)
    %calculates geopoterntial altitude from geometric
    h=(Re/(Re+hg))*hg;
end
