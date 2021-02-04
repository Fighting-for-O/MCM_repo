% 设置GUI按键
plotbutton = uicontrol('style', 'pushbutton', 'string', 'Run', 'fontsize', 12, 'position', [150, 400, 50, 20], 'callback', 'run=1;');
erasebutton = uicontrol('style', 'pushbutton', 'string', 'Stop', 'fontsize', 12, 'position', [250, 400, 50, 20], 'callback', 'freeze=1;');
quitbutton = uicontrol('style', 'pushbutton', 'string', 'Exit', 'fontsize', 12, 'position', [350, 400, 50, 20], 'callback', 'stop=1;close;');
number = uicontrol('style', 'text', 'string', '1', 'fontsize', 12, 'position', [20, 400, 50, 20]);
total_num = 100;
n = 100;
mu = [50, 50]; % 均值向量
Sigma = [200 0; 0 200]; % 协方差矩阵
r = mvnrnd(mu, Sigma, total_num);
r = fix(r);
z = zeros(n, n);
k = sub2ind(size(z), r(:, 1), r(:, 2)); %得到人的坐标的序列索引
healthy = z;
inf = z;
carrier = z;
cardate = z; %初始化三种类型的人群的矩阵以及携带日期的矩阵
first = randi([10, 90]);
healthy(k) = 200;
healthy(k(first)) = 0; %一开始没有感染者
carrier(k(first)) = 200;
cardate(k(first)) = 1; %初始化携带者天数矩阵
% 建立图像句柄
% 主事件循环
stop = 0; run = 1; freeze = 0;

while stop == 0

    if run == 1
        %先进行感染判断
        [x11, y11] = find(inf ~= 0);
        m = []; n = [];

        for i = 1:length(x11)
            m = [m; x11(i) - 2:x11(i) + 2];
            n = [n; y11(i) - 2:y11(i) + 2];
            m(m < 1) = 1;
            m(m > 100) = 100;
            n(n < 1) = 1;
            n(n > 100) = 100;
        end

        %m的每一行为距离感染者为2以内的行坐标
        %n的每一行为距离感染者为2以内的列坐标
        %接下来判断这个以感染者为中心5*5的矩阵中是否有健康人
        x22 = []; y22 = []; fm = 0;

        if ~isempty(m)
            fm = length(m(:, 1));
        end

        for i = 1:fm
            mat = healthy(m(i, :), n(i, :)); %某个感染者附近的坐标
            [x21, y21] = find(healthy(m(i, :), n(i, :)) ~= 0); %healthy(m(i,:),n(i,:)是5*5的矩阵，其第几行就代表m那一行的第几个元素，n同理对应列下标
            x22 = [x22, m(i, x21)];
            y22 = [y22, n(i, y21)];
        end

        for i = 1:length(x22)
            pro = rand;
            a = pro > 0.6;
            b = pro < 0.6;
            healthy(x22(i), y22(i)) = 200 * a; %200说明没病
            carrier(x22(i), y22(i)) = 200 * b;
            cardate(x22(i), y22(i)) = b;
        end

        %得到感染者附近的健康人坐标，并以一定的概率使其成为携带者
        %接下来进行携带者变为感染者,以及携带天数增加
        date = find(cardate == 4);
        carrier(date) = 0; %这里的意思是指，一个携带者在经过了四天之后就变成了感染者，这个地方可以做一做文章，很有意思
        cardate(date) = 0;
        inf(date) = 200;
        cardate(cardate ~= 0) = cardate(cardate ~= 0) + 1; %已经感染的感染者的感染天数加一
        % 现在来进行人群的移动



        %%%%有病的人的移动
        %%作者为什么要使用的inf真的是没有办法理解

        [x1_, y1_] = find(inf ~= 0);
        infnum = length(x1_);
        inf = z;

        for i = 1:infnum
            x1_(i) = randi([x1_(i) - 7, x1_(i) + 7]); y1_(i) = randi([y1_(i) - 7, y1_(i) + 7]);

            while x1_(i) < 3 || x1_(i) > 97 || y1_(i) < 3 || y1_(i) > 97%若碰壁则重新取点
                x1_(i) = randi([x1_(i) - 7, x1_(i) + 7]); y1_(i) = randi([y1_(i) - 7, y1_(i) + 7]);

                if x1_(i) < 0%因为重新取点可能导致不停的往一个方向加或减从而永远也无法跳出while所以对于过分的点直接让其等于一个正常值
                    x1_(i) = 3;
                elseif y1_(i) < 0
                    y1_(i) = 3;
                elseif x1_(i) > 100
                    x1_(i) = 97;
                elseif y1_(i) > 100
                    y1_(i) = 97;
                end

         end

            end%感染者的移动
            idx1 = sub2ind(size(z), x1_, y1_); %得出感染者移动后的坐标索引
            inf(idx1) = 200; %将感染者的位置标注在矩阵上

            [x2, y2] = find(healthy ~= 0); healnum = length(x2); %得到健康人的矩阵行列索引，以及健康人的数量
            healthy = z;

            for i = 1:healnum
                x2(i) = randi([x2(i) - 7, x2(i) + 7]); y2(i) = randi([y2(i) - 7, y2(i) + 7]); %健康人随机运动

                while x2(i) < 3 || x2(i) > 97 || y2(i) < 3 || y2(i) > 97 ||~isempty(find(idx1 == sub2ind(size(z), x2(i), y2(i)), 1))%检测健康人是否与感染者的位置重叠若重叠则换位置
                    x2(i) = randi([x2(i) - 7, x2(i) + 7]); y2(i) = randi([y2(i) - 7, y2(i) + 7]);

                    if x2(i) < 0
                        x2(i) = 3;
                    elseif y2(i) < 0
                        y2(i) = 3;
                    elseif x2(i) > 100
                        x2(i) = 97;
                    elseif y2(i) > 100
                        y2(i) = 97;
                    end

                end

            end

            idx2 = sub2ind(size(z), x2, y2); %得到健康人移动后的下标
            healthy(idx2) = 200;

            [x3, y3] = find(carrier ~= 0); carnum = length(x3);
            dateidx = sub2ind(size(z), x3, y3);
            cardate_ = cardate;
            cardate = z;
            carrier = z;

            for i = 1:carnum
                x3(i) = randi([x3(i) - 7, x3(i) + 7]); y3(i) = randi([y3(i) - 7, y3(i) + 7]); %携带者随机运动

                while x3(i) < 3 || x3(i) > 97 || y3(i) < 3 || y3(i) > 97 ||~isempty(find(idx1 == sub2ind(size(z), x3(i), y3(i)), 1)) ||~isempty(find(idx2 == sub2ind(size(z), x3(i), y3(i)), 1))%检测携带者是否与感染者和健康人的位置重叠若重叠则重新取点
                    x3(i) = randi([x3(i) - 7, x3(i) + 7]); y3(i) = randi([y3(i) - 7, y3(i) + 7]);

                    if x3(i) < 0
                        x3(i) = 3;
                    elseif y3(i) < 0
                        y3(i) = 3;
                    elseif x3(i) > 100
                        x3(i) = 97;
                    elseif y3(i) > 100
                        y3(i) = 97;
                    end

                end

            end

            idx3 = sub2ind(size(z), x3, y3); %得到携带者移动后的下标索引
            cardate(idx3) = cardate_(dateidx);
            carrier(idx3) = 200;

            image(cat(3, inf, healthy, carrier));
            stepnumber = 1 + str2double(get(number, 'string')); %更新迭代步数，每迭代一次就加一
            set(number, 'string', num2str(stepnumber))%将加一后的迭代代数更新
            pause(0.01)

        end

        if freeze == 1
            run = 0;
            freeze = 0;
        end

    end
