module ApplicationHelper

	def header
	render template: "layouts/header"
	end
	def footer
	render template: "layouts/footer"
	end
	def sidebar_home
		@categories = Category.get_all
		render template: "layouts/sidebar_home"
	end
	def error_messages_for
	render template: "shared/error_messages"
	end
	def to_alias(str)
	    str.downcase
	    str.gsub!(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/,"a")
	    str.gsub!(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/,"e")
	    str.gsub!(/ì|í|ị|ỉ|ĩ/,"i")
	    str.gsub!(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/,"o")
	    str.gsub!(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/,"u")
	    str.gsub!(/ỳ|ý|ỵ|ỷ|ỹ/,"y")
	    str.gsub!(/đ/,"d")
	    str.gsub!(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/,"-")
	    str.gsub!(/-+-/,"-")
	    str.gsub!(/^\-+|\-+$/,"")
	    return str
	end

	def uri_filter(name, url ='') 
        
        #get current url
        if(url.blank?)
            url = request.original_url
        end
        
        url_explode = url.split('?')
        if(url_explode.length > 1)          
            query_string = url_explode.last
            
            params = query_string.split('&')
            params.each_with_index do |param, index|
				explode_param = param.split('=')
                if(explode_param[0] == name)
                	params.delete_at(index)
                end
			end
            url_explode.pop            
            new_query_string = params.join("&")
            # return url_explode
            url_explode.push(new_query_string)
            
            #general result
            new_url = url_explode.join("?")
            return new_url
        end
        return url
    end

    def generate_new_url(params)
        
        if(params.length <= 0)
            return ''
        end

        url = ""
        query_string = '';
		params.each_with_index do |obj, index|
			key 	= obj[:name]
			value 	= obj[:value]
			url = self.uri_filter(key)

			query_string += key.to_s + '=' + value.to_s
		end

        explode_url     = url.split('?')
        end_explode_url = explode_url.last
        
        if(explode_url.length > 1 && end_explode_url.size > 0)
            return url + '&' + query_string;
        else
            url = url.gsub!('?', '',)
            return url + '?' +query_string;
        end   
    end

	def pagination(config)
		@total_row 		= Float(config[:total_row])
		@limit_per_page = config[:limit_per_page] ? Float(config[:limit_per_page]) : 5.0
		@current_page 	= config[:page] ? config[:page] : 1
		@total_page 	= (@total_row / @limit_per_page).ceil
		@original_url   = request.original_url
		@first_page		= 1
		@last_page		= @total_page
		@next_page		= (@current_page + 1) > @total_page ? (@current_page + 1) : @total_page
		@previous_page	= (@current_page - 1) > 0 ? (@current_page - 1) : 1
		@start_page		= (@current_page + 1) > @total_page ? (@current_page + 1) : @total_page

		page_range 	= config[:page_range] ? config[:page_range] : 5
		distance    = page_range % 2 == 1 ? ((Float(page_range) - 1) / 2).floor : (Float(page_range) / 2).floor
		@start 		= (@current_page - distance) > 0  ? (@current_page - distance) : 1
		@end 		= (@start + page_range) - 1 < @total_page ? (@start + page_range) - 1 : @total_page

		if(@end - @start <= page_range)
    		@start = ((@end - page_range) + 1) > 0 ? ((@end - page_range) + 1) : 1
    	end
		render template: "shared/pagination"
	end
end