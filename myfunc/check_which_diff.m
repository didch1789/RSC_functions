function which_diff = check_which_diff(difficultyidx, rulestr, crits)

if strcmp(rulestr, 'SPACE')
    if difficultyidx > 180, difficultyidx = difficultyidx - 180; end
    if difficultyidx > 90, difficultyidx = 180 - difficultyidx;end

    if (difficultyidx >= crits(4)) 
        which_diff = 4;
    elseif (difficultyidx >= crits(3) && difficultyidx < crits(4)) 
        which_diff = 3;
    elseif (difficultyidx >= crits(2) && difficultyidx <= crits(3)) 
        which_diff = 2;
    elseif (difficultyidx >= crits(1) && difficultyidx < crits(2))
        which_diff = 1;
    end

elseif strcmp(rulestr, 'SIZE')
    if difficultyidx < 1, difficultyidx = 1/difficultyidx;end
    if (difficultyidx >= crits(1) && difficultyidx < crits(2))
        which_diff = 4;
    elseif (difficultyidx >= crits(2) && difficultyidx < crits(3))
        which_diff = 3;
    elseif (difficultyidx >= crits(3) && difficultyidx < crits(4))
        which_diff = 2;
    elseif (difficultyidx >= crits(4))
        which_diff = 1;
    end 
end

end