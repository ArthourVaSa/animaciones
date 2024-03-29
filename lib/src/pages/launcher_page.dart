// ignore_for_file: avoid_unnecessary_containers

import 'package:animaciones/src/routes/routes.dart';
import 'package:animaciones/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños Page'),
      ),
      body: const _ListaOpciones(),
      drawer: const _MenuPrincipal(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: ((context, index) => ListTile(
            leading: FaIcon(
              pageRoutes[index].icon,
              color: appTheme.accentColor,
            ),
            title: Text(pageRoutes[index].title),
            trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pageRoutes[index].page,
                ),
              );
            },
          )),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [

            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  child: const Text(
                    "AV",
                    style: TextStyle(fontSize: 50),
                  ),
                  backgroundColor: appTheme.currentTheme.accentColor,
                ),
              ),
            ),

            const Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.accentColor,
              ),
              title: const Text("Dark Mode"),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.accentColor,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),

            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.accentColor,
                ),
                title: const Text("Custom Theme"),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.accentColor,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
