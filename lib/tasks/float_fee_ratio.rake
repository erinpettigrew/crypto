desc 'Copy fee_ratio contents to temp_fee_ratio'
task :copy_fees => :environment do
  Exchange.all.each do |exchange|
    exchange.temp_fee_ratio = exchange.fee_ratio
    exchange.save
  end
end
