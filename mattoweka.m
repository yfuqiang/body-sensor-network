function [] = mattoweka(input_matrix)
b={'xacc_std','yacc_std','zacc_std','xacc_sum','yacc_sum','zacc_sum','xacc_corr','yacc_corr','zacc_corr','xacc_fft','yacc_fft','zacc_fft','xrad_std','yrad_std','zrad_std','xrad_sum','yrad_sum','zrad_sum','xrad_corr','yrad_corr','zrad_corr','xrad_fft','yrad_fft','zrad_fft','action'};
matlab2weka("imu",b,input_matrix,0)
saveARFF('C:\Users\Sato\Desktop\datata.csv.arff',ans);

end

