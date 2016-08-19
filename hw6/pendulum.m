function T = pendulum(L,a0)
    g = 9.8;
    t = 1*10^(-6);
    T = 0;
    vel = 0;
    if L > 0
        while a0 > 0
            acc = -g * sin(a0) / L;
            vel = vel + acc * t;
            a0 = a0 + vel*t;
            T = T + t;
        end
        T = T*4; 
    end
end