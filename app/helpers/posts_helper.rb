module PostsHelper
  def names
    ['fork','head set','column spacer','handle bar','stem','stemcap','grip','bar tape','bar end','saddle','seatpost','seatclamp','tire','tube','wheel','hub','cog','lockring','free wheel','quick release','crank','chainring','chain','bottom brancket','pedals','toecrip','toestrap','brake','brake lever','brake cable','shifter','rack','bottle','light','lock','bell','helmet','bag']
  end

  def components
    ary =  Part.attribute_names
    n = ary.index("created_at")
    ary[1..n-1].each_slice(2).to_a
  end


  def post_components
    Post.find(params[:id]).part
  end
end

