% ����GUI����
plotbutton = uicontrol('style', 'pushbutton', 'string', 'Run', 'fontsize', 12, 'position', [150, 400, 50, 20], 'callback', 'run=1;');
erasebutton = uicontrol('style', 'pushbutton', 'string', 'Stop', 'fontsize', 12, 'position', [250, 400, 50, 20], 'callback', 'freeze=1;');
quitbutton = uicontrol('style', 'pushbutton', 'string', 'Exit', 'fontsize', 12, 'position', [350, 400, 50, 20], 'callback', 'stop=1;close;');
number = uicontrol('style', 'text', 'string', '1', 'fontsize', 12, 'position', [20, 400, 50, 20]);
total_num = 100;
n = 100;
mu = [50, 50]; % ��ֵ����
Sigma = [200 0; 0 200]; % Э�������
r = mvnrnd(mu, Sigma, total_num);
r = fix(r);
z = zeros(n, n);
k = sub2ind(size(z), r(:, 1), r(:, 2)); %�õ��˵��������������
healthy = z;
inf = z;
carrier = z;
cardate = z; %��ʼ���������͵���Ⱥ�ľ����Լ�Я�����ڵľ���
first = randi([10, 90]);
healthy(k) = 200;
healthy(k(first)) = 0; %һ��ʼû�и�Ⱦ��
carrier(k(first)) = 200;
cardate(k(first)) = 1; %��ʼ��Я������������
% ����ͼ����
% ���¼�ѭ��
stop = 0; run = 1; freeze = 0;

while stop == 0

    if run == 1
        %�Ƚ��и�Ⱦ�ж�
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

        %m��ÿһ��Ϊ�����Ⱦ��Ϊ2���ڵ�������
        %n��ÿһ��Ϊ�����Ⱦ��Ϊ2���ڵ�������
        %�������ж�����Ը�Ⱦ��Ϊ����5*5�ľ������Ƿ��н�����
        x22 = []; y22 = []; fm = 0;

        if ~isempty(m)
            fm = length(m(:, 1));
        end

        for i = 1:fm
            mat = healthy(m(i, :), n(i, :)); %ĳ����Ⱦ�߸���������
            [x21, y21] = find(healthy(m(i, :), n(i, :)) ~= 0); %healthy(m(i,:),n(i,:)��5*5�ľ�����ڼ��оʹ���m��һ�еĵڼ���Ԫ�أ�nͬ���Ӧ���±�
            x22 = [x22, m(i, x21)];
            y22 = [y22, n(i, y21)];
        end

        for i = 1:length(x22)
            pro = rand;
            a = pro > 0.6;
            b = pro < 0.6;
            healthy(x22(i), y22(i)) = 200 * a; %200˵��û��
            carrier(x22(i), y22(i)) = 200 * b;
            cardate(x22(i), y22(i)) = b;
        end

        %�õ���Ⱦ�߸����Ľ��������꣬����һ���ĸ���ʹ���ΪЯ����
        %����������Я���߱�Ϊ��Ⱦ��,�Լ�Я����������
        date = find(cardate == 4);
        carrier(date) = 0; %�������˼��ָ��һ��Я�����ھ���������֮��ͱ���˸�Ⱦ�ߣ�����ط�������һ�����£�������˼
        cardate(date) = 0;
        inf(date) = 200;
        cardate(cardate ~= 0) = cardate(cardate ~= 0) + 1; %�Ѿ���Ⱦ�ĸ�Ⱦ�ߵĸ�Ⱦ������һ
        % ������������Ⱥ���ƶ�



        %%%%�в����˵��ƶ�
        %%����ΪʲôҪʹ�õ�inf�����û�а취���

        [x1_, y1_] = find(inf ~= 0);
        infnum = length(x1_);
        inf = z;

        for i = 1:infnum
            x1_(i) = randi([x1_(i) - 7, x1_(i) + 7]); y1_(i) = randi([y1_(i) - 7, y1_(i) + 7]);

            while x1_(i) < 3 || x1_(i) > 97 || y1_(i) < 3 || y1_(i) > 97%������������ȡ��
                x1_(i) = randi([x1_(i) - 7, x1_(i) + 7]); y1_(i) = randi([y1_(i) - 7, y1_(i) + 7]);

                if x1_(i) < 0%��Ϊ����ȡ����ܵ��²�ͣ����һ������ӻ���Ӷ���ԶҲ�޷�����while���Զ��ڹ��ֵĵ�ֱ���������һ������ֵ
                    x1_(i) = 3;
                elseif y1_(i) < 0
                    y1_(i) = 3;
                elseif x1_(i) > 100
                    x1_(i) = 97;
                elseif y1_(i) > 100
                    y1_(i) = 97;
                end

         end

            end%��Ⱦ�ߵ��ƶ�
            idx1 = sub2ind(size(z), x1_, y1_); %�ó���Ⱦ���ƶ������������
            inf(idx1) = 200; %����Ⱦ�ߵ�λ�ñ�ע�ھ�����

            [x2, y2] = find(healthy ~= 0); healnum = length(x2); %�õ������˵ľ��������������Լ������˵�����
            healthy = z;

            for i = 1:healnum
                x2(i) = randi([x2(i) - 7, x2(i) + 7]); y2(i) = randi([y2(i) - 7, y2(i) + 7]); %����������˶�

                while x2(i) < 3 || x2(i) > 97 || y2(i) < 3 || y2(i) > 97 ||~isempty(find(idx1 == sub2ind(size(z), x2(i), y2(i)), 1))%��⽡�����Ƿ����Ⱦ�ߵ�λ���ص����ص���λ��
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

            idx2 = sub2ind(size(z), x2, y2); %�õ��������ƶ�����±�
            healthy(idx2) = 200;

            [x3, y3] = find(carrier ~= 0); carnum = length(x3);
            dateidx = sub2ind(size(z), x3, y3);
            cardate_ = cardate;
            cardate = z;
            carrier = z;

            for i = 1:carnum
                x3(i) = randi([x3(i) - 7, x3(i) + 7]); y3(i) = randi([y3(i) - 7, y3(i) + 7]); %Я��������˶�

                while x3(i) < 3 || x3(i) > 97 || y3(i) < 3 || y3(i) > 97 ||~isempty(find(idx1 == sub2ind(size(z), x3(i), y3(i)), 1)) ||~isempty(find(idx2 == sub2ind(size(z), x3(i), y3(i)), 1))%���Я�����Ƿ����Ⱦ�ߺͽ����˵�λ���ص����ص�������ȡ��
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

            idx3 = sub2ind(size(z), x3, y3); %�õ�Я�����ƶ�����±�����
            cardate(idx3) = cardate_(dateidx);
            carrier(idx3) = 200;

            image(cat(3, inf, healthy, carrier));
            stepnumber = 1 + str2double(get(number, 'string')); %���µ���������ÿ����һ�ξͼ�һ
            set(number, 'string', num2str(stepnumber))%����һ��ĵ�����������
            pause(0.01)

        end

        if freeze == 1
            run = 0;
            freeze = 0;
        end

    end
