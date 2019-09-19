module Helpers

  def wait_and_text(element)
    @count = 0
    100.times do
      Capybara.default_max_wait_time = 0.1
      @count += 1
      begin
        @texto = find(element).text
        break if @texto == 'Resgate confirmado'
      rescue StandardError
        raise if @count == 100
      end
      Capybara.default_max_wait_time = 10
    end
    @texto
  end

end