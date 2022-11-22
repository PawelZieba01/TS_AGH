function H = freqs_lab(B,A,Om)
%Frequency response of transmittance H(s)=B(s)/A(s)
%Om - frequency in rad/s, s=j*Om

As = polyval(A, 1i*Om);
Bs = polyval(B, 1i*Om);

H = Bs./As;
end
