# awesome_floating_button

 A Expandable Floating Button

## Getting Started

<img src="https://github.com/garimavirtual1234/awesome_floating_button/blob/main/recording_enumelator.gif" height="400em">

To use this plugin:

In your flutter project add the dependency:

```yalm
dependencies:
    ...
    awesome_floating_button: ^0.0.1
```

## Example
```
 AwesomeFloatingButton(
        buttonBgColor: Colors.blue,
        iconColor: Colors.white,
        iconButtonList: [
          //icon1
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab1");
          }, icon: const Icon(Icons.phone_forwarded),
          ),
          //icon2
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab2");
          },
            icon: const Icon(Icons.gif_box),
            //size: 20,
          ),
          //icon3
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab3");
          }, icon: const Icon(Icons.mail),
          ),
          //icon4
          IconButton(
            color: Colors.white, onPressed: () {
            print("tab4");
          }, icon: const Icon(Icons.person),
          ),
      ],
      )
```




