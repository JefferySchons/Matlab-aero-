function [hg]= geopoterntial_to_geometric(h,Re)
    %calculates geometric altitude from geopoterntial
    hg=(h*Re)/(Re-h);
end
