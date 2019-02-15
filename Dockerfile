FROM fedora

RUN yum install -y tar make gcc ruby ruby-devel rubygems graphviz rubygem-nokogiri asciidoctor unzip findutils which wget git zlib-devel python
RUN dnf install -y redhat-rpm-config
RUN gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.0.0.alpha.2 && \
gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.7 && \
gem install --no-ri --no-rdoc coderay pygments.rb thread_safe epubcheck kindlegen && \
mkdir /documents

WORKDIR /asciidoctor-latex
ADD . .
RUN gem build asciidoctor-latex.gemspec
RUN gem install *.gem

WORKDIR /documents

CMD ["/bin/bash"]