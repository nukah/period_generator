#!/usr/bin/ruby
require 'active_support/core_ext/date'

class PeriodGenerator
  attr_reader :from, :to
  attr_accessor :ranges

  def initialize(from, to)
    @from = from
    @to = to
    @ranges = []
  end

  def run
    period_start = from
    begin
      period_end = [period_start.advance(months: 12, days: -1), to].min
      ranges << (period_start..period_end)
      period_start = period_end.advance(days: 1)
    end while period_start < to
    ranges
  end
end
