module AAWS
  class Base
    include ClassLevelInheritableAttributes
    
    cattr_inheritable :default_params
    @default_params = {:service => 'AWSECommerceService'}
    
    def self.establish_connection(access_key)
      raise ArgumentError, "Missing access key in establish_connection" if access_key.blank?
      @default_params[:aws_access_key_id] = access_key
    end
    
    def self.connection
      @@aws_connection ||= Connection.new("http://ecs.amazonaws.com")
    end
    
    def self.get(options={})
      raise ConnectionError, 'You forgot to establish_connection with an AWS access key' if @default_params[:aws_access_key_id].blank?
      params, options = {}, default_params.merge(options)
      options.map { |k,v| params[k.to_s.camelize.gsub(/^aws/i, 'AWS')] = v }
      connection.get('/onca/xml', params)
    end
    
    def self.parse(xml)
      Hpricot::XML(xml)
    end
  end 
end