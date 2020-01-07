function [] = plot_abc (input_matrix)

subplot(2,1,1);
plot(input_matrix(:,2),'r');
hold on
plot(input_matrix(:,3),'y');
hold on
plot(input_matrix(:,4),'g');
hold off


subplot(2,1,2);
plot(input_matrix(:,5),'r');hold on
plot(input_matrix(:,6),'y');hold on
plot(input_matrix(:,7),'g');hold off
end