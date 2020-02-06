��    G      T              �  �  �  �   6  &  �      �  =    �   P	  �   =
     �
  t     3   x  Z   �  ?      G  �   a  E   �  �   )  a   �  6   J     �    �     �  D   �  #   �  :         [  �   x  H     �   ]  �     6   �     �  �   �  L   �  V       \     e  	   y  �   �  m   [  "   �  :   �  B   '  .   j  C   �  �  �  �   �  J   �  H   �        #   5  #   Y  L   }  I   �  I     E   ^  G   �  <   �  H   )   R   r   :   �   (    !  O   )!  ?   y!  ?   �!  =   �!  M   7"  G   �"  <   �"  7   
#  8   B#  �  {#  E  %  �   d'  �  @(      *  =  <*  �   z+    b,     w-  t   ~-  3   �-  Z   '.  M  �.    �/  �   �1  u   �2  ]  3  �   q4  `   5  /   w5  �  �5  V   K7  �   �7  D   E8  V   �8  [   �8  �   =9  �   3:  K  �:  �   <  �   �<  ,   h=  e  �=  �   �>  �   �?  �  @  ,   �A     �A  Y  �A  �   @C  ;   �C  y   %D  p   �D  J   E  |   [E    �E  �  �H  �   nJ  ]   K  C   bK  I   �K  3   �K  u   $L  a   �L  a   �L  b   ^M  _   �M  M   !N  `   oN  R   �N  R   #O     vO  �   �O  �   �P  D   9Q  B   ~Q  R   �Q  _   R  A   tR  <   �R  8   �R   $ # On some machines, this initial command may be necessary:
$ wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python

$ # Python module for parsing YAML (pyYAML), for test suite:
$ # (If wget fails, check at http://pyyaml.org/wiki/PyYAML
$ # what the current version is.)
$ cd ~
$ wget http://pyyaml.org/download/pyyaml/PyYAML-3.10.tar.gz
$ tar -xzf PyYAML-3.10.tar.gz
$ cd PyYAML-3.10
$ sudo python setup.py install $ # if you installed tarantool locally after build
$ tarantool
$ # - OR -
$ # if you didn't install tarantool locally after build
$ ./src/tarantool $ # make a subdirectory named `bin`
$ mkdir ~/tarantool/bin

$ # link Python to bin (this may require superuser privileges)
$ ln /usr/bin/python ~/tarantool/bin/python

$ # get to the test subdirectory
$ cd ~/tarantool/test

$ # run tests using Python
$ PATH=~/tarantool/bin:$PATH ./test-run.py $ CC=gcc-4.8 CXX=g++-4.8 cmake . $ apt install -y build-essential cmake make coreutils sed \
      autoconf automake libtool zlib1g-dev \
      libreadline-dev libncurses5-dev libssl-dev \
      libunwind-dev libicu-dev \
      python python-pip python-setuptools python-dev \
      python-msgpack python-yaml python-argparse python-six python-gevent $ brew install cmake make autoconf binutils zlib \
       autoconf automake libtool \
       readline ncurses openssl libunwind-headers icu4c \
       && pip install python-daemon \
       msgpack-python pyyaml configargparse six gevent $ cd ~/tarantool
$ make clean         # unnecessary, added for good luck
$ rm CMakeCache.txt  # unnecessary, added for good luck
$ cmake .            # start initiating with build type=Debug $ make $ pip install -r \
      https://raw.githubusercontent.com/tarantool/test-run/master/requirements.txt \
      --user $ rm ~/tarantool/bin/python
$ rmdir ~/tarantool/bin $ xcode-select --install
$ xcode-select -switch /Applications/Xcode.app/Contents/Developer $ yum install -y gcc gcc-c++ cmake make coreutils sed \
      autoconf automake libtool zlib-devel \
      readline-devel ncurses-devel openssl-devel \
      libunwind-devel libicu-devel \
      python python-pip python-setuptools python-devel \
      python-msgpack python-yaml python-argparse python-six python-gevent ======================================================================
TEST                                            RESULT
------------------------------------------------------------
box/bad_trigger.test.py                         [ pass ]
box/call.test.py                                [ pass ]
box/iproto.test.py                              [ pass ]
box/xlog.test.py                                [ pass ]
box/admin.test.lua                              [ pass ]
box/auth_access.test.lua                        [ pass ]
... etc. A C/C++ compiler. |br| Ordinarily, this is ``gcc`` and ``g++`` version 4.6 or later. On Mac OS X, this is ``Clang`` version 3.2+. A build automation tool. |br| For all platforms this is ``GNU Make``. A program for downloading source repositories. |br| For all platforms, this is ``git``. It allows downloading the latest complete set of source files from the Tarantool repository on GitHub. A program for managing the build process. |br| For all platforms, this is ``CMake`` version 2.8+. Alternatively, download Apple's default Xcode toolset: Building from source Finally, use Python ``pip`` to bring in Python packages that may not be up-to-date in the distro repositories. (On CentOS 7, it will be necessary to install ``pip`` first, with :code:`sudo yum install epel-release` followed by :code:`sudo yum install python-pip`.) For Debian/Ubuntu, say: For FreeBSD (instructions below are for FreeBSD 10.1+ release), say: For FreeBSD, use ``gmake`` instead. For Mac OS X (instructions below are for OS X El Capitan): For RHEL/CentOS/Fedora, say: For downloading Tarantool source and building it, the platforms can differ and the preferences can differ. But strategically the steps are always the same. Get tools and libraries that will be necessary for building and testing. If some Python modules are not available in a repository, it is best to set up the modules by getting a tarball and doing the setup with ``python setup.py`` like this: If you encounter a ``curl`` or ``OpenSSL`` errors on this step try installing ``openssl111`` package of the specific ``1.1.1d`` version. If you're using Homebrew as your package manager, say: Make RPM and Debian packages. Next, it's highly recommended to say ``make install`` to install Tarantool to the ``/usr/local`` directory and keep your system clean. However, it is possible to run the Tarantool executable without installation. On rare occasions, the submodules need to be updated again with the command: On some platforms, it may be necessary to specify the C and C++ versions, for example: Python and modules. |br| Python interpreter is not necessary for building Tarantool itself, unless you intend to use the "Run the test suite" option in step 5. For all platforms, this is ``python`` version 2.7+ (but not 3.x). You need the following Python modules: Run the test suite. See also: The CMake option for hinting that the result will be distributed is :code:`-DENABLE_DIST=ON`. If this option is on, then later ``make install`` will install ``tarantoolctl`` files in addition to ``tarantool`` files. The CMake option for specifying build type is :samp:`-DCMAKE_BUILD_TYPE={type}`, where :samp:`{type}` can be: The absolutely necessary ones are: The output should contain reassuring reports, for example: This creates the 'tarantool' executable in the ``src/`` directory. This starts Tarantool in the interactive mode. This step is only necessary once, the first time you do a download. This step is optional. It's only for people who want to redistribute Tarantool. We highly recommend to use official packages from the `tarantool.org <https://tarantool.org/download.html>`_ web-site. However, you can build RPM and Debian packages using `PackPack <https://github.com/packpack/packpack>`_ or using the ``dpkg-buildpackage`` or ``rpmbuild`` tools. Please consult ``dpkg`` or ``rpmbuild`` documentation for details. This step is optional. Tarantool's developers always run the test suite before they publish new versions. You should run the test suite too, if you make any changes in the code. Assuming you downloaded to ``~/tarantool``, the principal steps are: To install all required dependencies, follow the instructions for your OS: To prevent later confusion, clean up what's in the ``bin`` subdirectory: Use CMake to initiate the build. Use ``make`` to complete the build. Verify your Tarantool installation: You can not install `zlib-devel <https://www.zlib.net/>`_  package this way. `Autoconf <https://www.gnu.org/software/autoconf/>`_ library, any version `Automake <https://www.gnu.org/software/automake/>`_ library, any version `ICU <http://site.icu-project.org/download>`_ library, recent version `Libtool <https://www.gnu.org/software/libtool/>`_ library, any version `OpenSSL <https://www.openssl.org>`_ library, version 1.0.1+ `ReadLine <http://www.gnu.org/software/readline/>`_ library, any version `Tarantool README.md <https://github.com/tarantool/tarantool/blob/2.2/README.md>`_ `Zlib-devel <https://www.zlib.net/>`_ library, any version ``Debug`` -- used by project maintainers ``RelWithDebInfo`` -- used for production, also provides debugging capabilities ``Release`` -- used only if the highest performance is required `argparse <https://pypi.python.org/pypi/argparse>`_ version 1.1 `gevent <https://pypi.python.org/pypi/gevent>`_ version 1.1.2 `msgpack-python <https://pypi.python.org/pypi/msgpack-python>`_ version 0.4.6 `ncurses <https://www.gnu.org/software/ncurses/>`_ library, any version `pyyaml <https://pypi.python.org/pypi/PyYAML>`_ version 3.10 `six <https://pypi.python.org/pypi/six>`_ version 1.8.0 cd ~/tarantool
$ git submodule update --init --recursive Project-Id-Version: Tarantool 1.10
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-02-06 15:02+0000
PO-Revision-Date: 2019-12-20 21:24+0300
Last-Translator: 
Language: ru
Language-Team: 
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 $ # На некоторых машинах может потребоваться такая начальная команда:
$ wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python

$ # Модуль Python для анализа YAML (pyYAML) для набора тестов:
$ # (Если wget не работает, проверьте на сайте http://pyyaml.org/wiki/PyYAML
$ # актуальность версии.)
$ cd ~
$ wget http://pyyaml.org/download/pyyaml/PyYAML-3.10.tar.gz
$ tar -xzf PyYAML-3.10.tar.gz
$ cd PyYAML-3.10
$ sudo python setup.py install $ # если tarantool установлен локально после сборки
$ tarantool
$ # - ИЛИ -
$ # если tarantool не установлен локально после сборки
$ ./src/tarantool $ # создание поддиректории под названием `bin`
$ mkdir ~/tarantool/bin

$ # привязка Python к bin (могут потребовать права пользователя superuser)
$ ln /usr/bin/python ~/tarantool/bin/python

$ # переход в поддиректорию с тестами
$ cd ~/tarantool/test

$ # проведение тестирования с помощью Python
$ PATH=~/tarantool/bin:$PATH ./test-run.py $ CC=gcc-4.8 CXX=g++-4.8 cmake . $ apt install -y build-essential cmake make coreutils sed \
      autoconf automake libtool zlib1g-dev \
      libreadline-dev libncurses5-dev libssl-dev \
      libunwind-dev libicu-dev \
      python python-pip python-setuptools python-dev \
      python-msgpack python-yaml python-argparse python-six python-gevent $ brew install cmake autoconf binutils zlib \
       autoconf automake libtool \
       readline ncurses openssl libunwind-headers icu4c \
       && pip install python-daemon \
       msgpack-python pyyaml configargparse six gevent $ cd ~/tarantool
$ make clean         # необязательно, добавлено на удачу
$ rm CMakeCache.txt  # необязательно, добавлено на удачу
$ cmake .            # начать с типом сборки = Debug (отладка) $ make $ pip install -r \
      https://raw.githubusercontent.com/tarantool/test-run/master/requirements.txt \
      --user $ rm ~/tarantool/bin/python
$ rmdir ~/tarantool/bin $ xcode-select --install
$ xcode-select -switch /Applications/Xcode.app/Contents/Developer $ yum install -y gcc gcc-c++ cmake make coreutils sed \
      autoconf automake libtool zlib-devel \
      readline-devel ncurses-devel libyaml-devel openssl-devel \
      libunwind-devel libicu-devel \
      python python-pip python-setuptools python-devel \
      python-msgpack python-yaml python-argparse python-six python-gevent ======================================================================
TEST                                            RESULT
------------------------------------------------------------
box/bad_trigger.test.py                         [ pass ]
box/call.test.py                                [ pass ]
box/iproto.test.py                              [ pass ]
box/xlog.test.py                                [ pass ]
box/admin.test.lua                              [ pass ]
box/auth_access.test.lua                        [ pass ]
... etc. Компилятор C/C++. |br| Как правило, это ``gcc`` и ``g++`` версии 4.6 или более новой. На Mac OS X это ``Clang`` версии 3.2+. Средство автоматизации сборок. |br| На всех платформах это``GNU Make``. Программа для скачивания репозиториев исходного кода. |br| Для всех платформ это будет ``git``. Программа позволяет скачивать самый актуальный набор исходных файлов из репозитория Tarantool'а на GitHub. Программа для управления процессом сборки. |br| Для всех платформ это будет ``CMake`` версии 2.8+. Либо загрузите стандартный пакет Xcode для разработки: Сборка из исходных файлов Наконец, используйте ``pip`` в Python, чтобы импортировать пакеты Python, которые могут быть неактуальны в репозиториях дистрибутивов.  (В CentOS 7 будет необходимо сначала установить ``pip`` так: :code:`sudo yum install epel-release`, а затем :code:`sudo yum install python-pip`.) Если вы используете Debian/Ubuntu, выполните команду: Если вы используете FreeBSD (дальнейшие инструкции работают для FreeBSD 10.1+), выполните команду: В FreeBSD используйте вместо этого ``gmake``. Если вы используете Mac OS X (команды для OS X El Capitan): Если вы используете RHEL/CentOS/Fedora, выполните команду: При загрузке исходных файлов и сборке Tarantool'а могут отличаться платформы и настройки, но в целом предпринимаются одинаковые действия. Найдите средства и библиотеки, которые будут нужны для сборки и тестирования. Если некоторые модули Python недоступны в репозитории, лучше всего произвести настройку модулей, скачав пакет в формате TAR и выполнив установку с помощью ``python setup.py`` следующим образом: Если на данном шаге вы сталкиваетесь с ошибками ``curl`` или ``OpenSSL``, попробуйте установить пакет ``openssl111`` версии ``1.1.1d``. Если вы пользуетесь Homebrew в качестве менеджера пакетов, выполните команду: Создайте пакеты RPM и Debian. Далее настоятельно рекомендуется выполнить команду ``make install`` для установки Tarantool'а в директорию ``/usr/local`` и поддержания порядка в системе. Однако, можно запустить исполняемый файл и без установки. В редких случаях вложенные модули необходимо снова обновить с помощью команды: На некоторых платформах может потребоваться указать версии C и C++, например: Python и его модули. |br| Интерпретатор для Python не нужен для сборки самого Tarantool'а, если вы не планируете проводить тестирование из шага 5. Для всех платформ это будет ``python`` версии 2.7+ (но не 3.x). Необходимы следующие модули Python: Проведите тестирование. См. также: Чтобы указать в CMake, что результат будет распределен, используется опция :code:`-DENABLE_DIST=ON`. При наличии такой опции ``make install`` в дальнейшем установит файлы ``tarantoolctl`` в дополнение к файлам ``tarantool``. Чтобы указать тип сборки в CMake используется опция :samp:`-DCMAKE_BUILD_TYPE={type}`, где :samp:`{type}` может быть: Абсолютно необходимы следующие: Вывод должен включать в себя обнадеживающие результаты, например: При этом создается исполняемый файл 'tarantool' в директории ``src/``. Tarantool запустится в интерактивном режиме. Это действие следует выполнить только один раз при первой загрузке. Это необязательное действие, которое следует выполнить только тем, кто хочет перераспределить Tarantool. Мы настоятельно рекомендуем использовать официальные пакеты с сайта `tarantool.org <https://tarantool.org/download.html>`_. Однако, можно собрать пакеты RPM и Debian с помощью `PackPack <https://github.com/packpack/packpack>`_ или путем использования средств ``dpkg-buildpackage`` или ``rpmbuild``. Для получения более подробной информации обратитесь к документации по ``dpkg`` или ``rpmbuild``. Это необязательное действие. Разработчики Tarantool'а всегда проводят тестирование до публикации новых версий. Следует проводить тестирование, если внесены изменения в код. Итак, после загрузки в ``~/tarantool`` основные действия: Чтобы установить все необходимые зависимости, следуйте инструкциям для вашей ОС: Во избежание путаницы очистите поддиректорию ``bin``: Используйте CMake, чтобы начать сборку. Используйте ``make`` для завершения сборки. Проверьте установку Tarantool'а: Таким образом невозможно установить пакет `zlib-devel <https://www.zlib.net/>`_. библиотека `Autoconf <https://www.gnu.org/software/autoconf/>`_ любой версии библиотека `Automake <https://www.gnu.org/software/automake/>`_ любой версии библиотека `ICU <http://site.icu-project.org/download>`_ последней версии библиотека `Libtool <https://www.gnu.org/software/libtool/>`_ любой версии библиотека `OpenSSL <https://www.openssl.org>`_ версии 1.0.1+ библиотека `ReadLine <http://www.gnu.org/software/readline/>`_ любой версии `Tarantool README.md <https://github.com/tarantool/tarantool/blob/2.2/README.md>`_ библиотека `Zlib-devel <https://www.zlib.net/>`_ любой версии ``Debug`` -- отладка, используется эксплуатационным персоналом на проекте ``RelWithDebInfo`` -- используется для сборки в эксплуатации, также предоставляет возможности отладки ``Release`` -- релиз, используется только при необходимости высокой производительности `argparse <https://pypi.python.org/pypi/argparse>`_ версии 1.1 `gevent <https://pypi.python.org/pypi/gevent>`_ версии 1.1.2 `msgpack-python <https://pypi.python.org/pypi/msgpack-python>`_ версии 0.4.6 библиотека `ncurses <https://www.gnu.org/software/ncurses/>`_ любой версии `pyyaml <https://pypi.python.org/pypi/PyYAML>`_ версии 3.10 `six <https://pypi.python.org/pypi/six>`_ версии 1.8.0 cd ~/tarantool
$ git submodule update --init --recursive 