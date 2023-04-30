function [] = test_generate()

[~,X,Y] = generate_p_w(1,4);

scatter((X+Y)/2,(X-Y)/2)
grid on 
end

