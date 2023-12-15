function [cnt_f] = myspecialFilter(cnt,type,points)

switch type
    case 'car'
        [cnt_f] = mycarfilter(cnt);
    case 'low'
        ch= 1:size(cnt,2);
        [cnt_f] = myLowLapfilter(cnt,points,ch);
    case 'high'
        ch= 1:size(cnt,2);
        [cnt_f] = myHighLapfilter(cnt,points,ch);
end
        
end

