workdir: "/data"

rule all:
    input: "hello_worlds.txt", "word_count.txt"
    message: "Executing all: input={input}."

rule make_world:
    output: "world.txt"
    message: "Executing make_world: output={output}."
    shell:
         "echo 'world ' $(date) > {output}"

rule make_venus:
    output: "venus.txt"
    message: "Executing make_venus: output={output}."
    shell:
         "echo 'venus ' $(date) > {output}"

rule hello_worlds:
    input: "world.txt", "venus.txt"
    output: "hello_worlds.txt"
    message: "Executing hello_world: input={input}, output={output}."
    shell:
         "echo 'Hello' |  cat - {input} >> {output} "

rule get_words:
    output: "pg25330.txt"
    message: "Executing get_words: output={output}"
    shell:
         "wget http://www.gutenberg.org/cache/epub/25330/pg25330.txt"

rule count_words:
    input: "pg25330.txt"
    output: "word_count.txt"
    message: "Executing count_words: input={input}, output={output}"
    shell:
         "wc -w {input} > word_count.txt"
