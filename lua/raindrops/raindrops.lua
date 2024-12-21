return function(n)
   local tojoin = {}
   -- https://stackoverflow.com/a/1407187/
   if n % 3 == 0 then
      tojoin[#tojoin + 1] = "Pling"
   end
   if n % 5 == 0 then
      tojoin[#tojoin + 1] = "Plang"
   end
   if n % 7 == 0 then
      tojoin[#tojoin + 1] = "Plong"
   end
   if #tojoin > 0 then
      return table.concat(tojoin, "")
   else
      return tostring(n)
   end
end
