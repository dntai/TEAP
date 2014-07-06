function [mainFreq RESsignal] = RES_feat_mainfreq(RESsignal)
%Computes the main frequency of a respiration signal.
% Inputs:
%  RESsignal: the RES signal.
%
%Outputs:
%  mainFreq: the main respiration frequency, given in Hz
%  RESSignal: the RES signal with the values computed inside: will be faster if
%          you run-it a second time: if the feature was already comptued for
%          this signal, only fetches the results.
%
%Copyright Guillaume Chanel 2013
%Copyright Frank Villaro-Dixon Creative Commons BY-SA 4.0 2014


%Make sure we have a RES signal
RES_assert_type(RESsignal)

%If the features were already computed
if(Signal_has_feature(RESsignal, 'mainfreq'))
	sigFeatures = Signal_get_feature(RESsignal, 'mainfreq');
	mainFreq = sigFeatures.value;
	return;
end

raw = Signal_get_raw(RESsignal);
fs = Signal_get_samprate(RESsignal);

%Make a filter for our signal
Fpeak = 0.375;  % Peak Frequency
BW    = 0.5;    % Bandwidth
Apass = 1;      % Bandwidth Attenuation
[b, a] = iirpeak(Fpeak/(fs/2), BW/(fs/2), Apass);
Resp_filt = filtfilt(b, a, raw);


%Compute the energy spectrum
[RespPower, fResp] = pwelch(Resp_filt, 30*fs, [], [], fs); %30 seconds segment

%Take the frequencies we want
iFreqInterest = find(0.16 <= fResp & fResp <= 0.6);


[dummy, iMainFreq] = max(RespPower(iFreqInterest));

mainFrequency.value = fResp(iFreqInterest(iMainFreq));
mainFreq = mainFrequency.value;
RESsignal = Signal_set_feature(RESsignal, 'mainfreq', mainFrequency);

