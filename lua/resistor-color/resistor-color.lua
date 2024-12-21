return {
   color_code = function(color)
      local colors = {'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'}
      for k, v in pairs(colors) do
         if v == color then
            return k - 1
         end
      end
   end
}
