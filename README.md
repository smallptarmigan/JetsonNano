# JetsonNano

JetsonNanoのまとめ

## セットアップ

~~[NVIDIA-AI-IOT](https://github.com/NVIDIA-AI-IOT/jetcard)からイメージをダウンロードする。~~

(googleドライブからダウンロードが重すぎてできない．)

電源コード，LANケーブル，キーボード，マウスを接続する．

デフォルトではwifiは使えないため，有線接続を行う必要がある．

### SDカードの書き込み

[balenaEtcher](https://www.balena.io/etcher/)というソフトを使用します。

[Write Image to the microSD Card](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write)からイメージをダウンロードする．

### システム設定

以下のようにセットアップする．
```txt
lang               : english
keybord            : japanese
location           : Tokyo
name               : hi
hostname           : jetsonnano20
password           : tester
app partition size : 30422
```

ターミナルを開き，アップデートする．

```bash
$ sudo apt update
$ sudo apt upgrade
```
### IPの固定

```bash
$ sudo vi /etc/network/interfaces.d/network
```

networkに記述する．

```diff
+ auto lo
+ iface lo inet loopback

+ auto eth0

+ iface eth0 inet static
+ address 192.168.0.40
+ netmask 255.255.255.0
+ gateway 192.168.0.1
+ dns-nameservers 192.168.0.1,8.8.8.8
```

### SSHの有効化（直接接続する場合は飛ばす）

```bash
$ sudo apt install openssh-server
$ sudo service ssh status           # activeであることを確認
$ ip a                              # IPアドレスの確認
```

### IPを固定する

```bash
$ sudo vi /etc/network/interfaces.d/network
```

```deff
# The loopback network interface
+ auto lo
+ iface lo inet loopback

# The primary network interface
+ auto eth0

# DHCP 
# iface eth0 inet dhcp

# Static IP
+ iface eth0 inet static
+ address 192.168.1.100
+ netmask 255.255.255.0
+ gateway 192.168.1.254
+ dns-nameservers 192.168.0.1,8.8.8.8
```

### swap領域の拡張



### DeepLearn環境設定

tensorflow + kerasを導入する．

nvidia公式のものでないとtensorflowが入れれない．

公式のものにはkerasも同封されている．

```bash
./0_setup/setup.sh
```

tensorflowに内蔵されているKerasを使用する際に気を付ける．

以下のように記述する必要がある．

```diff
- from keras.models import model_from_json
+ from tensorflow.keras.models import model_from_json
```

### kerasを使ってmnistの学習

``` bash
python3 1_cnn_mnist/mnist_cnn.py
```












## 参考文献

1. [Jetson Nano関係のTIPSまとめ](https://qiita.com/karaage0703/items/b14c249aa33112669ee4)

1. [Jetson Nanoをセットアップしてディープラーニングで画像認識を試してみた](https://karaage.hatenadiary.jp/entry/2019/04/29/073000)

1. [Getting Started With Jetson Nano Developer Kit](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit)

1. [Jetson Nanoで使えるSDカードのイメージファイルまとめとイメージ書き込み方法](https://qiita.com/karaage0703/items/0583528f1f9c34911a31)

1. [Jetson Nanoでディープラーニング](https://qiita.com/karaage0703/items/b09f3c65eb3913d087e4)

1. [keras-team/keras mnist_cnn サンプル](https://github.com/keras-team/keras/blob/master/examples/mnist_cnn.py)