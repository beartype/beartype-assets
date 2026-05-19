=================================================
beartype —[ the bare-metal type checker ]— assets
=================================================

Unbearably aesthetic images, styles, and other assets for general-purpose reuse
across `beartype`_ projects – including:

+------------------------------+---------------------------------------------+------------------------+
| Location                     | Assets                                      | Creator                |
+==============================+=============================================+========================+
| `badge/ <assets badge_>`__   | |bear-ified| badge                          | |@posita|_             |
+------------------------------+---------------------------------------------+------------------------+
| `banner/ <assets banner_>`__ | **Mr. Nectar Palm,** the `beartype`_ mascot | `Felix Hildén`_        |
+------------------------------+---------------------------------------------+------------------------+
| `favicon.svg <favicon_>`__   | **Mr. Nectar Palm,** *iconified*.           | `Felix Hildén`_ |sup1| |
+------------------------------+---------------------------------------------+------------------------+

.. # ------------------( LINKS ~ beartype                   )------------------
.. _beartype:
   https://github.com/beartype/beartype

.. # ------------------( LINKS ~ local                      )------------------
.. _assets badge:
   badge/
.. _assets banner:
   banner/
.. _favicon:
   https://raw.githubusercontent.com/beartype/beartype-assets/main/favicon.svg

.. # ------------------( LINKS ~ users                      )------------------
.. _Felix Hildén:
   https://github.com/felix-hilden
.. |@posita| replace:: **@posita**
.. _`@posita`: https://github.com/posita

.. # ------------------( DIRECTIVES ~ image                 )------------------
.. # https://docutils.sourceforge.io/docs/ref/rst/directives.html#image
.. |bear-ified| image:: badge/bear-ified.svg
   :align: top

.. # ------------------( FOOTNOTES ~ non-sequiturs          )------------------

|sup1| With a *tiny* bit of help from |@posita|_. |shush|

.. Whomp-whomp. :'( See <https://github.com/github/markup/issues/216>.
.. |sup1| unicode:: U+00B9
.. |shush| unicode:: U+1F92B
..
    banner/logo.svg and favicon.svg were created with the following (requires ImageMagick):

        curl --location --remote-name 'https://github.com/visioncortex/vtracer/releases/download/0.6.4/vtracer-x86_64-unknown-linux-musl.tar.gz'
        sha256sum --check <(
          echo '9290ba0c90e224d6d212836dff5491407c1718bcb72f80b2b5a4a01816df5e40  vtracer-x86_64-unknown-linux-musl.tar.gz'
        )
        tar xpvf vtracer-x86_64-unknown-linux-musl.tar.gz
        ./vtracer \
            --hierarchical cutout \
            --mode polygon \
            --input banner/logo.png \
            --output banner/logo.svg
        magick \
            https://raw.githubusercontent.com/beartype/beartype-assets/main/banner/logo.png \
            -crop 1500x1400+0+0 +repage \
            -background none \
            -extent 1500x1500 \
            -gravity center \
            favicon.png
        ./vtracer \
            --hierarchical cutout \
            --mode polygon \
            --input banner/favicon.png \
            --output favicon.svg
        rm -f favicon.png
