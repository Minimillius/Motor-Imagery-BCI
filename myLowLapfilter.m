function [cnt_f] = myLowLapfilter(cnt, points, ch)
for n = 1:length(ch)

    A = points(:, ch(n));
    for i = 1:size(points, 2)
        B = points(:, i);
        dis(i) = sqrt(sum((A-B).^2));
        
    end

    %%
    [dis,ind] = sort(dis);
    neighbors_candid = points(:, ind(2:9));
    candid_ind = ind(2:9);
    candid_dis = dis(2:9);

    %%
    for i  = 1: size(neighbors_candid, 2)
        x1 = A(1);
        x2 = neighbors_candid(1, i);
        disx(i)  = sqrt(sum((x1-x2).^2));
    end
    [disx, indx] = sort(disx);
    
    %%
    for i  = 1: size(neighbors_candid,2)
        y1 = A(2);
        y2 = neighbors_candid(2,i);
        disy(i) = sqrt(sum((y1-y2).^2));
    end
    [disy,indy] = sort(disy);
    
    %     ind= [indx(1:2),indy(1:2)];
    ind = [indx(1:8)];
    neighbors = neighbors_candid(:, ind);
    d    = candid_dis(ind);
    indx = candid_ind(ind);
    %     plot(points(1,:),points(2,:),'ob',...
    %         'linewidth',3,'markersize',10,'markerfacecolor','b')
    
    %     hold on
    %     plot(A(1),A(2),'sr',...
    %         'linewidth',3,'markersize',15,'markerfacecolor','r')
    %
    %     plot(neighbors(1,:),neighbors(2,:),'sg',...
    %         'linewidth',3,'markersize',10,'markerfacecolor','g')
    %     hold off
    %     pause
    w= (1./d) / (sum((1./d)));
    for i=1:4
        cnt_neighbors(:,i) = cnt(:,indx(i))* w(i);
    end
    s= sum(cnt_neighbors,2);
    cnt_f(:,n)= cnt(:,ch(n)) -s;
    
end
end

