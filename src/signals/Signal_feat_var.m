%This file is part of TEAP.
%
%TEAP is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%
%TEAP is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with TEAP.  If not, see <http://www.gnu.org/licenses/>.

%> @file Signal_feat_var.m
%> @brief Computes the variance of a signal
%> @param  Signal
%> @retval  var: the calculated var, using the @c var() function
%
%> @author Copyright Frank Villaro-Dixon, BSD Simplified, 2014
function [variance] = Signal_feat_var(Signal)

Signal__assert_mine(Signal);

raw = Signal__get_raw(Signal);

variance = var(raw);


