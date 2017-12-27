module PostsHelper
	def clean_date(dateTime)
		string1 = dateTime.to_s
		time = string1.slice(11..15)
		date = string1.slice(0..10)

		day = date.slice!(8..9)
		month = date.slice!(5..6)
		year = date.slice!(0..3)

		

		clean_month = set_month(month)
		return "#{clean_month} #{day}, #{year} at #{time} UTC"

	end

	def set_month(month)
		case month
		when "01"
			month = "January"
		when "02"
			month = "February"
		when "03"
			month = "March"
		when "04"
			month = "April"
		when "05"
			month = "May"
		when "06"
			month = "June"
		when "07"
			month = "July"
		when "08"
			month = "August"
		when "09"
			month = "September"
		when "10"
			month = "October"
		when "11"
			month = "November"
		when "12"
			month = "December"
		end


	end
end
