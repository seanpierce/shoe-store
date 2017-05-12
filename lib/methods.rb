# The promy wanted a capitalize name CALLBACK. However, that convolutes the "find_or_create_by" method.
# So, I will write a public capitalize_name method to use on form inputs
class String
  def cap_name
    split_name = self.split(' ')
    cap_name = []
    split_name.each do |word|
      cap_name.push(word.capitalize)
    end
    cap_name.join(' ')
  end
end
