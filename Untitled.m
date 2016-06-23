% close all;
% plot(Mtime, alt*3.28084, 'b');
% hold on;
% axis([850 1200 0 700*5]);
% ylabel('Altitude (ft)')
% xlabel('Mission Time (Sec)')
% 
% 
% plot(Mtime-19, (gpsalt-480)*3.28084, 'r');
% 
% 
% legend('Barometer Altitude(ft)', 'GPS Alitude (ft)')
% grid minor;
% title ('Altitude vs Time');
[xyz h dec dip f] = wrldmagm(1000, 42.283, -71.35, decyear(2015,7,4),'2015')