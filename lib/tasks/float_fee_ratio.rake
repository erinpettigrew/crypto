desc 'Copy fee_ratio contents to temp_fee_ratio'
task :copy_fees => :environment do
  Exchange.all.each do |exchange|
    exchange.temp_fee_ratio = exchange.fee_ratio
    exchange.save
  end
end

desc 'Convert temp_fee_ratio from string to float, copy into fee_ratio'
task :convert_fees_to_float => :environment do
  Exchange.all.each do |exchange|
    exchange.fee_ratio = exchange.temp_fee_ratio.to_f
  end
end
