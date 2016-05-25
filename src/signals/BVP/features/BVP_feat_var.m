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

%> @file BVP_feat_var.m
%> @brief Computes the variance of a @b BVP signal
%> @param  BVPSignal: the @b BVP signal
%> @retval mvar: the signal's variance
%
%> @author Copyright Frank Villaro-Dixon, BSD Simplified, 2014
function mvar = BVP_feat_var(BVPSignal)

%Make sure we have an BVP signal
BVPSignal = BVP__assert_type(BVPSignal);

mvar = Signal_feat_var(BVPSignal);

end

