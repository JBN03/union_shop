import 'package:flutter/material.dart';

import 'header_logo.dart';
import 'header_links.dart';
import 'header_actions.dart';
import 'header_compact_actions.dart';
import 'header_search.dart';

class Header extends StatefulWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onSearch;
  final VoidCallback? onAccount;
  final VoidCallback? onCart;
  final VoidCallback? onMenu;
  final String? id;

  const Header({
    super.key,
    this.id,
    this.onLogoTap,
    this.onSearch,
    this.onAccount,
    this.onCart,
    this.onMenu,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final HeaderSearchModel _searchModel = HeaderSearchModel();
  bool _showSearch = false;
  bool _lastShowInline = false;
  final GlobalKey _logoKey = GlobalKey();
  final GlobalKey _centerKey = GlobalKey();
  final GlobalKey _actionsKey = GlobalKey();
  

  void _toggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
      
      if (!_showSearch) {
        _searchModel.controller.clear();
        _searchModel.clearResults();
      }
    });
  }

  

  @override
  void dispose() {
    _searchModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final calculated = screenHeight * 0.10;
    final height = calculated.clamp(56.0, 88.0).toDouble();
    final screenWidth = MediaQuery.of(context).size.width;
    final showLinks = screenWidth >= 800;

    const minInlineSearchWidth = 900;
    final showInline = screenWidth >= minInlineSearchWidth;

    if (_showSearch && _lastShowInline && !showInline) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).unfocus();
      });
    }
    _lastShowInline = showInline;

    final headerBar = Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              
              if (showLinks)
                Center(
                  child: KeyedSubtree(
                    key: _centerKey,
                    child: const HeaderLinks(),
                  ),
                ),
              
              Positioned(
                left: 0,
                child: KeyedSubtree(
                  key: _logoKey,
                  child: Row(
                    children: [
                      HeaderLogo(onLogoTap: widget.onLogoTap),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),

              
              Positioned(
                right: 0,
                child: KeyedSubtree(
                  key: _actionsKey,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_showSearch && showInline) HeaderSearchField(model: _searchModel, inline: true),
                      if (_showSearch) const SizedBox(width: 8),
                      showLinks
                          ? HeaderActions(onSearch: () { widget.onSearch?.call(); _toggleSearch(); }, onAccount: widget.onAccount, onCart: widget.onCart)
                          : HeaderCompactActions(onSearch: () { widget.onSearch?.call(); _toggleSearch(); }, onAccount: widget.onAccount, onCart: widget.onCart, onMenu: widget.onMenu),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        headerBar,
        
        
        if (_showSearch && !showInline)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HeaderSearchField(model: _searchModel, inline: false),
          ),
        if (_showSearch) HeaderSearchResults(model: _searchModel),
      ],
    );
  }
}

