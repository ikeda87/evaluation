class Girl
  def initialize(name, options = {})
    @name = name
    @options = options 
  end

  def introduce
    puts "私の名前は#{@name}、好きな男性のタイプは#{@options[:want]}が感じられる人かな！"
    puts "やっぱ男の性格って大事だよね〜まじ卍。"
  end

  def do_you_like_this_kind_of_man(chosen)
    puts "え？#{chosen.name}はどうかって？"
    judgement(chosen.options)
  end

  private
  def judgement(status)
    if status[:style] == set_require[:must] && status[:personality] == set_require[:want]
      puts "#{status[:job]}で#{status[:style]}とかサイコーじゃない？♡"
      puts "さらには#{set_require[:want].slice(0..1)}そうな人だし、もうなんなの？♡"
    else
      if status[:personality] == set_require[:want]
        puts "うーん、確かに#{status[:personality].slice(0..1)}い感じはするよね〜。"
        puts "#{status[:job]}っていうのがちょっとなぁ・・・。（やっぱイケメンに限る）"
      elsif status[:style] == set_require[:must]
        puts "うーん、#{status[:style]}は捨てがたいな〜。"
        puts "でもダメ、#{status[:job]}ってなんか信用できないし。"
      end
    end
  end

  def set_require
    @options
  end
end

class Boy
  attr_accessor :name, :options
  def initialize(name, options = {})
    @name = name
    @options = options
  end
end

hanako_request = { want: "優しさ", must: "イケメン" }
hanako = Girl.new("花子", hanako_request)
hanako.introduce

boy_status = { job: "芸人", style: "フツメン", personality: "優しさ" }
geinin = Boy.new("芸人の○", boy_status)
hanako.do_you_like_this_kind_of_man(geinin)

boy_status = { job: "バンドマン", style: "イケメン", personality: "優しさがない" }
bandman = Boy.new("バンドの□", boy_status)
hanako.do_you_like_this_kind_of_man(bandman)

boy_status = { job: "俳優", style: "イケメン", personality: "優しさ" }
actor = Boy.new("俳優の△", boy_status)
hanako.do_you_like_this_kind_of_man(actor)
